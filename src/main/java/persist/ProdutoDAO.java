package persist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Produto;

public class ProdutoDAO {
    private Connection connection;

    public ProdutoDAO() {
    	try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			System.out.println("Problemas ao abrir conexão na classe ContatoDAO.");
			e.printStackTrace();
		} catch (ClassNotFoundException cnfe){
			System.out.println("Xiii... Deu ruim na importação do jar no servidor.");
		}
    }

	public void cadastrar(Produto produto){
		try {
			// cria um preparedStatement
			String sql = "insert into produtos (nome, preco, quantidade_estoque) values (?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			// preenche os valores
			stmt.setString(1, produto.getNome());
			stmt.setFloat(2, produto.getPreco());
			stmt.setInt(3, produto.getQuantidade());
			
			//executa 
			stmt.execute();
			stmt.close();
		}catch(SQLException sqle) {
			System.out.println("Nao foi possivel processar a insercao");
		}catch(Exception e) {
			System.out.println("Erro desconhecido. Lamentamos o ocorrido");
		}
	}
}
