package com.alittlejavaafewpatterns;

class OnlyOnionsV{
    boolean forSkewer(){
        return true;
    }

    boolean forOnion(ShishD s){
        return s.onlyOnions();
    }

    boolean forLamb(ShishD s){
        return false;
    }

    boolean forTomato(ShishD s){
        return false;
    }
}