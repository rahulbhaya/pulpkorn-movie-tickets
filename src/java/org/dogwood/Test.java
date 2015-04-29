package org.dogwood;

import java.util.List;
import org.dogwood.beans.CastMember;

public class Test {
    
    public static void main(String[] args) {
        Database.getInstance().register("admin@admin.com","admin", "ADMIN");
    }
}