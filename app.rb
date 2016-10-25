
require "sinatra"
require "make_todo"

def createTarea
   Tarea.create(params[:task].upcase)
end

def deleteTarea
   Tarea.destroy(params[:idTarea])
end

def completeTarea
   Tarea.update(params[:completada])
end

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
   createTarea
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
   completeTarea
   redirect '/home/pendientes'
end

get "/borrarPendientes" do
   deleteTarea
   redirect '/home/pendientes'
end

get "/borrarCompletadas" do
   deleteTarea
   redirect '/home/completadas'
end