
require "sinatra"
require "make_todo"

get "/" do  
   erb :welcome 
end

post "/home" do
   erb :homeApp
end

post "/home/newTaskInterface" do   
   erb :newTask
end

post "/crearTarea" do
   Tarea.create(params[:task].upcase)
   redirect '/home/pendientes'
end

post "/tareasCreadas" do
   redirect '/home/pendientes'
end

post "/tareasCompletadas" do
   redirect '/home/completadas'
end

get "/home/pendientes" do
   @hashTareas = Tarea.all
   erb :listaPendientes
end

get "/home/completadas" do
   @hashTareas = Tarea.all
   erb :listaCompletas
end

get "/completarTarea" do
   Tarea.update(params[:completada])
   redirect '/home/pendientes'
end

get "/borrarPendientes" do
   Tarea.destroy(params[:idTarea])
   redirect '/home/pendientes'
end

get "/borrarCompletadas" do
   Tarea.destroy(params[:idTarea])
   redirect '/home/completadas'
end