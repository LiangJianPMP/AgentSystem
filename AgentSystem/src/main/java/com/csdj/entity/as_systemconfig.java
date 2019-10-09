package com.csdj.entity;

public class as_systemconfig {
    private  int id;
    private  int configType;
    private String configTypeName;
    private int  configTypeValue;
    private String  configValue;
    private   int  isStart;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getConfigType() {
        return configType;
    }

    public void setConfigType(int configType) {
        this.configType = configType;
    }

    public String getConfigTypeName() {
        return configTypeName;
    }

    public void setConfigTypeName(String configTypeName) {
        this.configTypeName = configTypeName;
    }

    public int getConfigTypeValue() {
        return configTypeValue;
    }

    public void setConfigTypeValue(int configTypeValue) {
        this.configTypeValue = configTypeValue;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public int getIsStart() {
        return isStart;
    }

    public void setIsStart(int isStart) {
        this.isStart = isStart;
    }
}
