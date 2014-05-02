package org.mybatis.jpetstore.controller;

import org.mybatis.jpetstore.domain.Category;
import org.mybatis.jpetstore.domain.Item;
import org.mybatis.jpetstore.domain.Product;
import org.mybatis.jpetstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CatalogCtrl {

    private Category category;
    private List<Product> productList;

    private Product product;
    private List<Item> itemList;

    private Item item;

    @Autowired
    private transient CatalogService catalogService;

    @RequestMapping("/Catalog.action")
    public String main() {
        return "catalog/Main";
    }

    @RequestMapping(value = "/Catalog.action", params = {"categoryId", "viewCategory"})
    public ModelAndView category(@RequestParam("categoryId") String categoryId) {
        ModelAndView modelAndView = new ModelAndView("catalog/Category");
        productList = catalogService.getProductListByCategory(categoryId);
        category = catalogService.getCategory(categoryId);
        modelAndView.addObject("category", category);
        modelAndView.addObject("productList", productList);
        return modelAndView;
    }

    @RequestMapping(value = "Catalog.action", params = {"productId", "viewProduct"})
    public ModelAndView product(@RequestParam("productId") String productId) {
        ModelAndView modelAndView = new ModelAndView("catalog/Product");
        itemList = catalogService.getItemListByProduct(productId);
        product = catalogService.getProduct(productId);
        System.out.println(product.getCategoryId());
        modelAndView.addObject("itemList", itemList);
        modelAndView.addObject("product", product);
        modelAndView.addObject("spring", true);
        return modelAndView;
    }

    @RequestMapping(value = "Catalog.action", params = {"viewItem", "itemId"})
    public ModelAndView item(@RequestParam("itemId") String itemId) {
        ModelAndView modelAndView = new ModelAndView("catalog/Item");
        item = catalogService.getItem(itemId);
        product = item.getProduct();
        modelAndView.addObject("item", item);
        modelAndView.addObject("product", product);
        return modelAndView;
    }

}
