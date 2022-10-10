package com.randomlee.tyrads_stepper;

public class Step {
    public int id;
    public String title;
    public String subtitle;
    public String content;

    public Step(int id, String title, String subtitle, String content) {
        this.id = id;
        this.title = title;
        this.subtitle = subtitle;
        this.content = content;
    }

    public Step() {
    }

    @Override
    public String toString() {
        return "{" +
                "\"id\":" + id +
                ", \"title\":\"" + title + "\"" +
                ", \"subtitle\":\"" + subtitle + "\"" +
                ", \"content\":\"" + content + "\"" +
                "}";
    }
}
