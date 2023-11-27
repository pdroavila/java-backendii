package persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import model.Cliente;

public class ClienteDAO {
    private Connection connection;

    public ClienteDAO() {
    	try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			System.out.println("Problemas ao abrir conexão na classe ClienteDAO.");
			e.printStackTrace();
		} catch (ClassNotFoundException cnfe){
			System.out.println("Xiii... Deu ruim na importação do jar no servidor.");
		}
    }

	public int cadastrar(Cliente cliente){
		try {
			// cria um preparedStatement
			String sql = "insert into clientes (nome, Cliente, endereco) values (?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			// preenche os valores
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getContato());
			stmt.setString(3, cliente.getEndereco());
			
			//executa 
			int sucesso = stmt.executeUpdate();
			stmt.close();

			return sucesso;
		}catch(SQLException sqle) {
			System.out.println("Nao foi possivel processar a insercao");
			return 0;
		}catch(Exception e) {
			System.out.println("Erro desconhecido. Lamentamos o ocorrido");
			return 0;
		}
	}

	
	public List<Cliente> listar() {
		List<Cliente> lista = new ArrayList<>();
		try {
			// consulta e apresenta na tela. 
			ResultSet rs = connection.createStatement().executeQuery("select * from clientes");
			Cliente c;
			while (rs.next()) {
				c = new Cliente();
				
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setEndereco(rs.getString("endereco"));
				c.setContato(rs.getString("contato"));
				lista.add(c);
			}
			return lista;
		}catch(SQLException sqle) {
			System.out.println("Nao foi possivel processar a listagem");
			return null;
		}catch(Exception e) {
			System.out.println("Erro desconhecido. Lamentamos o ocorrido");
			return null;
		}
	}


	public Cliente getContato(int id) {
		Cliente c = new Cliente();
		String sql = "select * from clientes where `id` = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setLong(1, id); // preenche o valor do ID na query
			//executa 
			ResultSet rs= stmt.executeQuery();
			// como só vai ter um, chamo next() uma vez só. o resultSet começa com 
			// o ponteiro apontando para antes do primerio resultado se tem resultado 
			// na consulta, ele retorna verdadeiro e aponta para ele.
			if (!rs.next() ) { 
			    System.out.println("dado nao encontrado");
			    return c;
			}
			c.setId(rs.getInt("id"));
			c.setNome(rs.getString("nome"));
			c.setContato(rs.getString("contato"));
			c.setEndereco(rs.getString("endereco"));
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Nao foi possivel carregar o dado solicitado");
		}		
		return c;		
	}

	public int alterar(Cliente cliente) {
		try {
			// cria um preparedStatement
			String sql = "update clientes set nome = ?, contato = ?, endereco = ? where id = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			// preenche os valores
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getContato());
			stmt.setString(3, cliente.getEndereco());
			stmt.setLong(4, cliente.getId());

			int sucesso = stmt.executeUpdate();
			stmt.close();

			return sucesso;
		}catch(SQLException sqle) {
			System.out.println("Nao foi possivel processar a alteracao");
			sqle.printStackTrace();
			return 0;

		}catch(Exception e) {
			System.out.println("Erro desconhecido. Lamentamos o ocorrido");
			return 0;
		}
	}

	public int remover(Cliente cliente) {
		try {
			// cria um preparedStatement
			String sql = "delete from clientes where id = ?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			// preenche os valores
			stmt.setLong(1, cliente.getId());
			//executa 
			int sucesso = stmt.executeUpdate();
			stmt.close();
			return sucesso;
		}catch(SQLException sqle) {
			System.out.println("Nao foi possivel processar a exclusao");
			return 0;

		}catch(Exception e) {
			System.out.println("Erro desconhecido. Lamentamos o ocorrido");
			return 0;
		}
	}
	
}
