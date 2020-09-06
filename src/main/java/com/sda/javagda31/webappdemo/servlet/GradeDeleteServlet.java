package com.sda.javagda31.webappdemo.servlet;

import com.sda.javagda31.webappdemo.database.EntityDao;
import com.sda.javagda31.webappdemo.model.Grade;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/grade/delete")
public class GradeDeleteServlet extends HttpServlet {
    private final EntityDao<Grade> gradeEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long gradeId = Long.parseLong(req.getParameter("id"));

        Optional<Grade> gradeOptional = gradeEntityDao.findById(gradeId, Grade.class);
        if (gradeOptional.isPresent()) {
            Grade grade = gradeOptional.get();
            gradeEntityDao.delete(grade);

            resp.sendRedirect(req.getContextPath() + "/student/details?id=" + grade.getStudent().getId());
        } else {
            resp.sendRedirect(req.getContextPath() + "/student");
        }
    }
}
