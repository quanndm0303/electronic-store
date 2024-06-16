/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Orders;

/**
 *
 * @author Acer
 */
public class OrderDAO extends GenericDAO<Orders> {

    @Override
    public List<Orders> findAll() {
        return queryGenericDAO(Orders.class);
    }

    @Override
    public int insert(Orders t) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([totalPrice]\n"
                + "           ,[accountId]\n"
                + "           ,[createAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", t.getTotalPrice());
        parameterMap.put("2", t.getAccountId());
        parameterMap.put("3", t.getCreateAt());
        return insertGenericDAO(sql, parameterMap);
    }

    public List<Orders> findCartByAccountId(int accountId) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Orders]\n"
                + "  where [accountId] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", accountId);
        return queryGenericDAO(Orders.class, sql, parameterMap);
    }

    public static void main(String[] args) {
        for (Orders order : new OrderDAO().findCartByAccountId(1)) {
            System.out.println(order);
        }
    }
}
