package org.dogwood;

import java.util.List;
import org.dogwood.beans.CastMember;

public class Test {
    
    public static void main(String[] args) {
        String movieId = Database.getInstance().getMovieByTitle("Home").getId();
        List<CastMember> cast = Dogwood.getCast(movieId);
        for (CastMember cm : cast) {
            System.out.println(cm.getName());
        }
    }
    
}