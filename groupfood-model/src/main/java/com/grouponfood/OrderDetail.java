package com.grouponfood;

/**
 * Created by Administrator on 10/6/2016.
 */
public class OrderDetail {
    private int orderDetailId;
    private MenuItem item;
    private int amount;

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public MenuItem getItem() {
        return item;
    }

    public void setItem(MenuItem item) {
        this.item = item;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
