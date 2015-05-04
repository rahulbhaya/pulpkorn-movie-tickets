package org.dogwood.beans;

import java.io.Serializable;

public class Help implements Serializable {

    private String topic, answer;

    public Help() {
    }

    public Help(String topic, String answer) {
        this.topic = topic;
        this.answer = answer;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

}
