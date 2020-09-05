package com.sda.javagda31.webappdemo.servlet;

import com.sda.javagda31.webappdemo.database.EntityDao;
import com.sda.javagda31.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/student")
public class StudentListServlet extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    // metoda której celem/zadaniem jest zwrócić użytkownikowi stronę html z listą studentów
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // pobierz listę studentów z bazy danych
        List<Student> studentList = studentEntityDao.findAll(Student.class);

        // przekazanie kolekcji/listy studentów do widoku (pliku jsp) (do wyświetlenia)
        req.setAttribute("jakastamsobie_lista", studentList);

        // wyświetl widok
        req.getRequestDispatcher("/student_list.jsp").forward(req, resp);
    }
}
