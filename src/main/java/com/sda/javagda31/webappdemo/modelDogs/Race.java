package com.sda.javagda31.webappdemo.modelDogs;

public enum Race {

    LABRADOR("Blablador"),
    HUSKY("Haski"),
    GOLDEN_RETRIEVER("Golden"),
    MOPS("Mopson"),
    JAMNIK("Hot-Dog"),
    CHIHUAHUA("Cziłała");

    private String name;

    Race(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
