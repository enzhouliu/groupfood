package com.grouponfood;

/**
 * Created by Administrator on 10/6/2016.
 */
public class MenuItem {

    private int itemId;
    private String item_name;
    private String item_english_name;
    private boolean isPopular;
    private String picturePath;
    private String alergicAlert;
    private int spicyLevel;
    private String description;
    private float price;


    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getItem_english_name() {
        return item_english_name;
    }

    public void setItem_english_name(String item_english_name) {
        this.item_english_name = item_english_name;
    }

    public boolean isPopular() {
        return isPopular;
    }

    public void setIsPopular(boolean isPopular) {
        this.isPopular = isPopular;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public String getAlergicAlert() {
        return alergicAlert;
    }

    public void setAlergicAlert(String alergicAlert) {
        this.alergicAlert = alergicAlert;
    }

    public int getSpicyLevel() {
        return spicyLevel;
    }

    public void setSpicyLevel(int spicyLevel) {
        this.spicyLevel = spicyLevel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
