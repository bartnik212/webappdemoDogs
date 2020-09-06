package com.sda.javagda31.webappdemo.model;

public enum GradeSubject {
    IT("Informatyka"),
    MATH("Matematyka"),
    ENGLISH("Angielski"),
    POLISH ("Polski"),
    HISTORY ("Historia"),
    BIOLOGY ("Przyra"),
    CHEMISTRY ("Chemia"),
    PE ("Wuef");

    private String name;

    GradeSubject(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

}
