/*
 * Author: Jiayi Zhao
 * This source code is used for my Master Project.
 * Non-commercial use only.
 */

package database;

import java.util.ArrayList;

public interface DatabaseController {

    //select
    ArrayList getAllElements();
//    ArrayList getElementsById(String id);
    boolean getElementById(String id);

    //insert
    int add(String[] v);

    //delete
    int delete(String id);

    //update
    int update(String id, String[] v);

    //end
    void close();
}
