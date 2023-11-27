package controller.logica;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastrarClienteLogica implements LogicaDoSistema{
    @Override
        public String executa(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return "cadastrar_cliente.jsp";
    }
}
