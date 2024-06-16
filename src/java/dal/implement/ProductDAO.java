/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import constant.CommonConst;
import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Product;

/**
 *
 * @author Acer
 */
public class ProductDAO extends GenericDAO<Product> {

    @Override
    public List<Product> findAll() {
        return queryGenericDAO(Product.class);
    }

    @Override
    public int insert(Product t) {
        return insertGenericDAO(t);
    }

    public List findAllColor() {
        return queryGenericDAO(Product.class);
    }

    public Product findById(Product product) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[color]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", product.getId());
        List<Product> list = queryGenericDAO(Product.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public List<Product> findByCategory(int categoryId, int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  where categoryId = ?\n"
                + "  order by id\n"
                + "  offset ? rows\n"
                + "  fetch next ? rows ONLY";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("categoryId", categoryId);
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public List<Product> findByName(String keyword, int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  where [name] like ?\n"
                + "  order by id\n"
                + "  offset ? rows\n"
                + "  fetch next ? rows ONLY";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecordByCategory(int categoryId) {
        String sql = "SELECT count(*)\n"
                + "  FROM [dbo].[Product]\n"
                + "  where categoryId = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", categoryId);
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT count(*)\n"
                + "  FROM [dbo].[Product]\n"
                + "  where [name] like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }

    public List<Product> findAllProduct(int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  order by id\n"
                + "  offset ? rows\n"
                + "  fetch next ? rows ONLY";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE [id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", id);
        deleteGenericDAO(sql, parameterMap);
    }

    public void update(Product product) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[color] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[categoryId] = ?\n"
                + " WHERE [id] =?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", product.getName());
        parameterMap.put("image", product.getImage());
        parameterMap.put("quantity", product.getQuantity());
        parameterMap.put("price", product.getPrice());
        parameterMap.put("color", product.getColor());
        parameterMap.put("description", product.getDescription());
        parameterMap.put("categoryId", product.getCategoryId());
        parameterMap.put("id", product.getId());
        updateGenericDAO(sql, parameterMap);

    }

    public void updateQuantity(Product product, int updatedQuantity) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET \n"
                + "      [quantity] = ?\n"
                + "\n"
                + " WHERE id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", updatedQuantity);
        parameterMap.put("2", product.getId());
        updateGenericDAO(sql, parameterMap);
    }

    public Product findProductById(int productId) {
                String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[color]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", productId);
        List<Product> list = queryGenericDAO(Product.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

}
