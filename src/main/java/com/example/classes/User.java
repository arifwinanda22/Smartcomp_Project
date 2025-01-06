package com.example.classes;

public class User extends BaseEntity {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String softSkills;
    private String hardSkills;
    private String phone;
    private String roleId;

    // Default constructor
    public User() {
    }

    // Parameterized constructor
    public User(String firstName, String lastName, String email, String password, String softSkills, String hardSkills, String phone, String roleId) {
        this.firstName = firstName != null ? firstName.trim() : null;
        this.lastName = lastName != null ? lastName.trim() : null;
        this.email = email != null ? email.trim().toLowerCase() : null;
        this.password = password;
        this.softSkills = softSkills != null ? softSkills.trim() : null;
        this.hardSkills = hardSkills != null ? hardSkills.trim() : null;
        this.phone = phone != null ? phone.trim() : null;
        this.roleId = roleId;
    }

    // Getters and Setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName != null ? firstName.trim() : null;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName != null ? lastName.trim() : null;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email != null ? email.trim().toLowerCase() : null;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSoftSkills() {
        return softSkills;
    }

    public void setSoftSkills(String softSkills) {
        this.softSkills = softSkills != null ? softSkills.trim() : null;
    }

    public String getHardSkills() {
        return hardSkills;
    }

    public void setHardSkills(String hardSkills) {
        this.hardSkills = hardSkills != null ? hardSkills.trim() : null;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone != null ? phone.trim() : null;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
