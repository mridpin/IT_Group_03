
/**
 *
 * @author Grupo 3
 */
public class Main {

   
    public static void main(String[] args) {
        
        //All the different sizes of the passwords that we will generate
        int passwordSizes [] = {15,20};
        
        for(int i=0;i<passwordSizes.length;i++)
        {
            //Length of the password to generate
            int size = passwordSizes[i];
            //Print the generated password
            System.out.println("Contraseña de "+size+" caracteres generada: "+generatePassword(size));
        }
        
    }
    //Method that calls the Web Service
    private static String generatePassword(int length) {
        webservices.Ejercicio1_Service service = new webservices.Ejercicio1_Service();
        webservices.Ejercicio1 port = service.getEjercicio1Port();
        return port.generatePassword(length);
    }
    
}
