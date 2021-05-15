package test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:dispatcherServlet-servlet.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MVCTest {
    @Autowired
    WebApplicationContext mvcIoc;
    MockMvc mockMvc =null;
    @Before
    public void init(){
        mockMvc = MockMvcBuilders.webAppContextSetup(mvcIoc).build();
    }
    @Test
    public void testPage() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("page","1")).andReturn();
        PageInfo pageInfo = (PageInfo) result.getRequest().getAttribute("pageInfo");
        System.out.println(pageInfo.getPages()+"  "+pageInfo.getTotal());
    }
}
