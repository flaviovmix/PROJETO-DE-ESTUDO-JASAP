package app.tarefas;

import app.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TarefaDAO {

    public List<TarefaBean> listarTarefas(boolean ativoOuInativo) {
        List<TarefaBean> lista = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM tarefas WHERE ativo = ? ");
        sql.append("ORDER BY id_tarefa DESC ");

        try (Connection conn = new ConexaoDB().abrirConexao();
                PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            ps.setBoolean(1, ativoOuInativo);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TarefaBean tarefa = new TarefaBean();
                    tarefa.setId_tarefa(rs.getInt("id_tarefa"));
                    tarefa.setTitulo(rs.getString("titulo"));
                    tarefa.setPrioridade(rs.getString("prioridade"));
                    tarefa.setDescricao(rs.getString("descricao"));
                    tarefa.setResponsavel(rs.getString("responsavel"));
                    tarefa.setData_conclusao(rs.getDate("data_conclusao"));
                    tarefa.setData_criacao(rs.getDate("data_criacao"));
                    tarefa.setAtivo(rs.getBoolean("ativo"));
                    lista.add(tarefa);
                }
            }

        } catch (SQLException erro) {
            erro.printStackTrace();
        }

        return lista;
    }

    public void alterarAtivoInativo(int id_tarefa, boolean ativo) {
        String sql = "UPDATE tarefas SET ativo = ? WHERE id_tarefa = ?";

        try (Connection conn = new ConexaoDB().abrirConexao();
                PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            ps.setBoolean(1, ativo);
            ps.setInt(2, id_tarefa);
            ps.executeUpdate();

            ps.close();
            System.out.println("passei no DAO");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
