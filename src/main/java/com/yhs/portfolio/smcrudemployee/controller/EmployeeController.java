package com.yhs.portfolio.smcrudemployee.controller;

import com.yhs.portfolio.smcrudemployee.dao.EmployeeMapper;
import com.yhs.portfolio.smcrudemployee.entity.Employee;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class EmployeeController {

    EmployeeMapper mapper;
    private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    @Autowired
    public EmployeeController(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    @RequestMapping("/")
    public ModelAndView index() {
//        logger.info(mapper.getAllEmployees().toString());
        ModelAndView mav = new ModelAndView("employees");
        mav.addObject("listEmployees", mapper.getAllEmployees());
        return mav;
    }

    @RequestMapping("/add-edit-employee")
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("add-edit-employee");
        mav.addObject("employee", new Employee());
        return mav;
    }

    @RequestMapping("/save-employee")
    public String insertEmployee(@ModelAttribute("employee") Employee employee) {

        if (employee.getId() == null) {
            mapper.saveEmployee(employee);

        } else {
            mapper.updateEmployee(employee);
        }

        return "redirect:/";
    }

    @RequestMapping("/delete-employee")
    public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
        mapper.deleteEmployee(employeeId);
        logger.info("delete employee id : " + employeeId);
        return "redirect:/";
    }

    @RequestMapping("/edit-employee")
    public ModelAndView editEmployee(@RequestParam("employeeId") int employeeId) {
        ModelAndView mav = new ModelAndView("add-edit-employee");
        Employee employee = mapper.findById(employeeId);
        mav.addObject("employee", employee);
        return mav;
    }
}
