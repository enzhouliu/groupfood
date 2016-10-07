package com.grouponfood;

/**
 * Created by Administrator on 10/6/2016.
 */
public class Location {
    private int locationId;
    private String address;
    private String zipcode;
    private int location_status;

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public int getLocation_status() {
        return location_status;
    }

    public void setLocation_status(int location_status) {
        this.location_status = location_status;
    }
}
