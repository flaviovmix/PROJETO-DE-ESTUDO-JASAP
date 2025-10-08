<%@page import="app.tarefas.TarefaBean"%>
<%@page import="app.tarefas.TarefaDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TarefaDAO tarefaDAO = new TarefaDAO();
    List<TarefaBean> tarefas = tarefaDAO.listarTarefas(true);
%>

<!DOCTYPE html>
<html lang="pt-BR">

    <head>
        <meta charset="UTF-8">
        <title>To-Do List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="./css/tabs.css">

        <link rel="stylesheet" href="./css/index-claro.css">
        <link rel="stylesheet" href="./css/modal-claro.css">

    </head>

    <body>
        <header>
            <div class="container">
                <button class="btn-add" onclick="window.location.href = 'novaTarefa.html'">Nova Tarefa</button>
            </div>
        </header>

        <div class="task-list ">
            <div class="tabs">
                <!-- Radios controlam as abas -->
                <div class="tab-links">
                    <a href="#" class="tab-link ativa">Ativas</a>
                    <a href="#" class="tab-link">Concluídas</a>
                </div>

                <!-- Conteúdo da Aba: ATIVAS -->
                <div class="tab-content">

                    <div id="conteudo-tarefas">
                        
                        <% for (TarefaBean tarefa : tarefas ) { %>             
                            <div class="task <%= tarefa.getPrioridade() %>">

                                <div class="task-content">
                                    <div class="task-title ">
                                        <a href="novaTarefa.html" class="link-sem-estilo"><%= tarefa.getTitulo() %></a>
                                    </div>
                                    <div class="task-meta">
                                        <a href="novaTarefa.html" class="link-sem-estilo">
                                            <span><i class="fas fa-layer-group"></i>0 etapas</span>
                                        </a>
                                        <span><i class="fas fa-calendar-alt"></i>14 ago - 2025</span>
                                        <span><i class="fas fa-user-alt"></i><%= tarefa.getResponsavel() %></span>

                                    </div>
                                    <span class="descricao"><%= tarefa.getDescricao() %></span>
                                </div>

                                <div class="task-actions">
                                    <div>
                                        <label class="checkbox-container">
                                            <div class="usuario_concluir">
                                                <div class="assigned"><strong>Quinta-feira, 14 ago - 2025</strong></div>
                                                <form action="#" method="get" style="display:inline;">
                                                    <input type="hidden" name="estado_atual" value="<%= tarefa.isAtivo() %>">
                                                    <input type="hidden" name="id_tarefa" value="<%= tarefa.getId_tarefa() %>">
                                                    <input type="checkbox" name="ativo">
                                                </form>
                                            </div>
                                        </label>
                                    </div>
                                    <a href="#" class="deletar-link">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                        <% } %>
                    </div>

                </div>
            </div>
        </div>

    </body>

</html>