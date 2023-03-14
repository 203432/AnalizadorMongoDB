/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package codigo;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.FindIterable;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.set;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;

import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author camac
 */
public class ConexionEjemplo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        conectarBD();
        // TODO code application logic here
    }
    public static void conectarBD(){
        System.out.println("Esstas creando una base de datos de mongo");
        
        //Conectar con el host y el puerto asignado de mongoDB
        MongoClient mongoClient = new MongoClient("localhost", 27017);
        
        //Crear la base de datos, el String miBaseDeDatos es el nombre que se le asignara a la BD
        String databaseName = "miBaseDeDatos";
        MongoDatabase database = mongoClient.getDatabase(databaseName);
        
        
        //Creacion de una tabla en MongoDB
        //Las tablas en Mongo son conocidas como colecciones
        String collectionName = "miColeccion";
        MongoCollection<Document> collection = database.getCollection(collectionName);

        //Insertar un elemento a la coleccion
        Document document = new Document();
        document.append("clave1", "valor1");
        document.append("clave2", "valor2");
        collection.insertOne(document);
        


//Obtener un documento de la colección
        Document query =  new Document("clave1", "valor1");
        MongoCursor<Document> cursor = collection.find(query).iterator();
        
        if (cursor.hasNext()) {
    Document result = cursor.next();
    System.out.println("Documento encontrado: " + result.toJson());
} else {
    System.out.println("No se encontraron documentos que coincidan con la consulta.");
}

//Obtener todos los elementos de la coleccion
FindIterable<Document> documents = collection.find();
for (Document documentos : documents) {
    System.out.println(documentos.toJson());
}

//Actualizar un documento
Bson filter = eq("clave1", "valor1");
Bson update = set("clave2", "nuevoValor");
UpdateResult result = collection.updateOne(filter, update);
System.out.println("Número de documentos actualizados: " + result.getModifiedCount());


//Eliminar un documento
filter = eq("clave1", "valor1");
DeleteResult resultdel = collection.deleteOne(filter);
System.out.println("Número de documentos eliminados: " + resultdel.getDeletedCount());


        mongoClient.close();
    }
}
