package com.csdj.test;

import com.csdj.service.UserService;
import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;

/**
 * @Autor: Cjc
 * @Descriptrion:
 * @Data: Create in 16:30 2019/9/24
 * @Modifried By:
 */
public class Demo01 {

    @Test
    public void main01() throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class user = Class.forName("com.csdj.service.user.UserServiceImpl");
        UserService userService = (UserService) user.newInstance();
        System.out.println(userService);
    }

    @Test
    public void main02() throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("");
    }

}
