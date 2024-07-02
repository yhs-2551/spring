package com.yhs.portfolio.smcrudemployee.dao;


import com.yhs.portfolio.smcrudemployee.entity.Employee;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import utils.MyBatisUtil;

import java.util.List;

@Repository
public class EmployeeMapper {
    public List<Employee> getAllEmployees() {
        SqlSession session = MyBatisUtil.getSessionFactory().openSession();
        List<Employee> employeeList = session.selectList("getAllEmployees");
        session.commit();
        session.close();
        return employeeList;
    }

    public void saveEmployee(Employee employee) {
        SqlSession session = MyBatisUtil.getSessionFactory().openSession();
        session.insert("insertEmployee", employee);
        session.commit();
        session.close();
    }

    public void deleteEmployee(int employeeId) {
        SqlSession session = MyBatisUtil.getSessionFactory().openSession();
        session.delete("deleteEmployee", employeeId);
        session.commit();
        session.close();
    }


    public Employee findById(int employeeId) {
        SqlSession session = MyBatisUtil.getSessionFactory().openSession();
        Employee employee = (Employee) session.selectOne("findById", employeeId);
        session.commit();
        session.close();
        return employee;
    }


    public void updateEmployee(Employee employee) {
        SqlSession session = MyBatisUtil.getSessionFactory().openSession();
       session.update("updateEmployee", employee);
        session.commit();
        session.close();

    }
}
