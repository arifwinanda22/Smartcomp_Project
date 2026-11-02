package com.example.Services;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Locale;

public class MidtransService {

   public static final String SERVER_KEY = System.getenv("MIDTRANS_SERVER_KEY") != null 
        ? System.getenv("MIDTRANS_SERVER_KEY") 
        : "SB-Mid-server-DUMMY_KEY";

    private static final String SNAP_SANDBOX_URL = "https://app.sandbox.midtrans.com/snap/v1/transactions";

    public static class SnapResponse {
        public String token;
        public String redirectUrl;
        public String error;
    }

    public static SnapResponse createTransaction(String orderId, double grossAmount, String itemName, String userName, String email) {
        SnapResponse res = new SnapResponse();
        
        if (grossAmount <= 0) {
            grossAmount = 50000;
        }

        try {
            HttpClient client = HttpClient.newHttpClient();
            String authHeader = "Basic " + Base64.getEncoder().encodeToString((SERVER_KEY.trim() + ":").getBytes(StandardCharsets.UTF_8));

            // URL satu pintu kembali ke halaman status pembayaran lokal
            String singleRedirectUrl = "http://localhost:8080/PBOGACOR_KELOMPOK2/payment";

            String payload = String.format(Locale.US,
                "{" +
                    "\"transaction_details\":{" +
                        "\"order_id\":\"%s\"," +
                        "\"gross_amount\":%.0f" +
                    "}," +
                    "\"item_details\":[{" +
                        "\"id\":\"item-1\"," +
                        "\"price\":%.0f," +
                        "\"quantity\":1," +
                        "\"name\":\"%s\"" +
                    "}]," +
                    "\"customer_details\":{" +
                        "\"first_name\":\"%s\"," +
                        "\"email\":\"%s\"" +
                    "}," +
                    "\"callbacks\":{" +
                        "\"finish\":\"%s\"" +
                    "}" +
                "}",
                orderId, grossAmount, grossAmount, 
                itemName.replace("\"", "'"), 
                userName.replace("\"", "'"), 
                (email != null && !email.isEmpty()) ? email : "peserta@smartcomp.id",
                singleRedirectUrl
            );

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(SNAP_SANDBOX_URL))
                    .header("Accept", "application/json")
                    .header("Content-Type", "application/json")
                    .header("Authorization", authHeader)
                    .POST(HttpRequest.BodyPublishers.ofString(payload))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String body = response.body();

            if (response.statusCode() == 200 || response.statusCode() == 201) {
                int tokenIdx = body.indexOf("\"token\":\"");
                if (tokenIdx != -1) {
                    int start = tokenIdx + 9;
                    int end = body.indexOf("\"", start);
                    res.token = body.substring(start, end);
                }
                int urlIdx = body.indexOf("\"redirect_url\":\"");
                if (urlIdx != -1) {
                    int start = urlIdx + 16;
                    int end = body.indexOf("\"", start);
                    res.redirectUrl = body.substring(start, end);
                }
            } else {
                res.error = "HTTP " + response.statusCode() + ": " + body;
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.error = e.getMessage();
        }
        return res;
    }
}




