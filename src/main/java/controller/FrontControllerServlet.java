package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.logica.LogicaDoSistema;
import model.Cliente;
import persist.ClienteDAO;

@WebServlet("/mvc")
public class FrontControllerServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String acao = "ExibirHome";
		if(req.getParameterMap().containsKey("a")) { // ?a=AlgumaCoisa
			acao = req.getParameter("a");
		}
        
		String nomeDaClasse = "controller.logica."+acao+"Logica";
		
		try {
			Class<?> classe = Class.forName(nomeDaClasse);
			LogicaDoSistema logica = (LogicaDoSistema)classe.getDeclaredConstructor().newInstance();
			String metodoHttp = req.getMethod();

			//Recebe o String após a execução da logica na classe carregada
			String pagina = logica.executa(req, resp);
			
			//Logica para Login;
			if(pagina.equals("login.jsp") && "POST".equals(metodoHttp)){
				String usuario = req.getParameter("usuario");
				String senha = req.getParameter("senha");

				if(usuario.equals("admin") && senha.equals("admin")){
					pagina = "home.jsp";
				}else{
					req.setAttribute("message", "Usuário e/ou senha incorreto(s)!");
				}
			}

			//Logica para cadastrar Cliente;
			if(pagina.equals("cadastrar_cliente.jsp") && "POST".equals(metodoHttp)){
				String nome = req.getParameter("nome");
				String contato = req.getParameter("contato");
				String endereco = req.getParameter("endereco");

				Cliente c = new Cliente();
				c.setNome(nome);
				c.setContato(contato);
				c.setEndereco(endereco);

				ClienteDAO conexao = new ClienteDAO();
				int cadastro = conexao.cadastrar(c);

				if(cadastro > 0){
					req.setAttribute("message", "Cadastro realizado com sucesso!");
				}else{
					req.setAttribute("message", "Ocorreu um erro ao cadastrar!");
				}
			}

			//Logica para listar clientes;
			if(pagina.equals("listar_clientes.jsp")){
				ClienteDAO conexao = new ClienteDAO();	
				req.setAttribute("listaClientes", conexao.listar());
			}

			//Logica para alterar cliente;
			if(pagina.equals("alterar_cliente.jsp")){
				if("POST".equals(metodoHttp)){
					int id = Integer.parseInt(req.getParameter("id"));
					String nome = req.getParameter("nome");
					String contato = req.getParameter("contato");
					String endereco = req.getParameter("endereco");

					Cliente c = new Cliente();
					c.setId(id);
					c.setContato(contato);
					c.setNome(nome);
					c.setEndereco(endereco);

					ClienteDAO conexao = new ClienteDAO();
					int alterar = conexao.alterar(c);

					req.setAttribute("id",c.getId());
					req.setAttribute("nome",c.getNome());
					req.setAttribute("contato", c.getContato());
					req.setAttribute("endereco", c.getEndereco());

					if(alterar > 0){
						req.setAttribute("message", "Cliente alterado com sucesso!");
					}else{
						req.setAttribute("message", "Erro ao alterar cliente!");
					}
				}else{
    				int id = Integer.parseInt(req.getParameter("id"));
					ClienteDAO cliente = new ClienteDAO();
					Cliente c = cliente.getContato(id);
					req.setAttribute("id",c.getId());
					req.setAttribute("nome",c.getNome());
					req.setAttribute("contato", c.getContato());
					req.setAttribute("endereco", c.getEndereco());
				}
			}

			//Logica para excluir cliente;
			if(pagina.equals("excluir_cliente.jsp")){
				if("POST".equals(metodoHttp)){
					int id = Integer.parseInt(req.getParameter("id"));

					Cliente c = new Cliente();
					c.setId(id);

					ClienteDAO conexao = new ClienteDAO();
					int excluir = conexao.remover(c);

					if(excluir > 0){
						pagina = "exclusao.jsp";
					}else{
						req.setAttribute("message", "Erro ao excluir cliente!");
					}
				}else{
    				int id = Integer.parseInt(req.getParameter("id"));
					ClienteDAO cliente = new ClienteDAO();
					Cliente c = cliente.getContato(id);
					req.setAttribute("id",c.getId());
					req.setAttribute("nome",c.getNome());
					req.setAttribute("contato", c.getContato());
					req.setAttribute("endereco", c.getEndereco());
				}
			}

			// faz o forward para a página JSP se nao voltar vazio
			if(!pagina.isEmpty()) {
				req.getRequestDispatcher(pagina).forward(req, resp);
			}

		}catch(Exception e) {
			throw new ServletException("A logica de negocios causou uma excecao. Desculpe.", e);
        }
    }
}