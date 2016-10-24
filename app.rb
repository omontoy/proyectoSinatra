
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

post "/newTaskInterface" do   
   erb :newTask
end

post "/crearTarea" do
   createTarea
   redirect '/pendientes'
end

post "/tareasCreadas" do
   redirect '/pendientes'
end

post "/tareasCompletadas" do
   redirect '/completadas'
end

get "/pendientes" do
   @hashTareas = Tarea.all
   erb :listaPendientes
end

get "/completadas" do
   @hashTareas = Tarea.all
   erb :listaCompletas
end

get "/completarTarea" do
   completeTarea
   redirect '/pendientes'
end

get "/borrarPendientes" do
   deleteTarea
   redirect '/pendientes'
end

get "/borrarCompletadas" do
   deleteTarea
   redirect '/completadas'
end