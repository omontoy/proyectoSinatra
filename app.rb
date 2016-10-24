
require "sinatra"
require "make_todo"

def createTarea
   Tarea.create(params[:task].upcase)
end

def deleteTarea
   Tarea.destroy(params[:idTarea])
end

def completar
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

get "/lista" do
   @hashTareas = Tarea.all
   erb :listaTareas
end

post "/creacionTarea" do
   createTarea
   redirect '/lista'
end

post "/tareaCreada" do
   redirect '/lista'
end

get "/borrarTareas" do
   deleteTarea
   redirect '/lista'
end

get "/borrarTareas2" do
   deleteTarea
   redirect '/tareasCompletadas'
end

get "/completarTarea" do
   completar
   redirect '/lista'
end

get "/tareasCompletadas" do
   @hashTareas = Tarea.all
   erb :completas
end
