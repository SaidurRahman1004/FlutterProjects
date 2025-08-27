import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Practice Task 6.28::Ans :Flutter Stack + Positioned – E-commerce Product Details Layout
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: Center(

      ),
    );
  }
}

class EcomerseAppCard extends StatelessWidget {
  const EcomerseAppCard({super.key});

  btnSnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)),);}
  final String Imageurl = "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxASEA8PEBAPDxAQFQ8QEA8QDw8QDw8QFREWFhUWFRYYHSggGBomHRUVITEhJSkrLi4uFx8zODMtOSgtLisBCgoKDg0OGg8QFy0dHx01Ky8tLy0tLS0tLisvLi0rLSstLS0tKy0tLS0tLS0tLSstLS0tLS0tLSs3LS0tLS0wLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABAECAwYHBQj/xABTEAACAQIBBgcIDAoIBwAAAAAAAQIDBBEFBxIhMUEGMlFhcXKzEyI1UlSBkbEXJGJzdJKToaK00dMUFiNCVZTB0tTwJTRjZKOkwuEVM0NFhLLx/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAEDBAIF/8QAIREBAAICAgICAwAAAAAAAAAAAAECAxEhMRJBIlEEE3H/2gAMAwEAAhEDEQA/AO4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKSkkm3qS1t8xGVWctawhHdisZPnw3ASgRnp+OviL7QpS8dfEX2gSQRsZeOviBafjr4q+0CSCP3/AI6+IvtKd/46+IvtAkgi4z8dfEX2ls604pybjJLFvHvdS5wJgOUZVzvudaVDJlpO70NTrYSlFvljGP5m3vnJY4asdphpZwMuSbUcnwbW1Khs/wAyNI3DroOVR4ZcIXsyZH5CP8UXfjdwj3ZKj8kv4kJdTBy38beEn6Jj8kv4kp+NvCT9FR+SX8SB1MHLfxu4RfouPyEf4otfDDhD+jI/IR/igOqA5LPOpe2s4f8AEsm1aVKTSdWFOUEsfF76cZPm00zp+S8o0rmjTuKE1UpVUpQkt6fqfMBLAAAAAAAAAAAAAR71YxS3OUU+jHH9hXEXeyPWiRcqVJRoVpx40YSa6cAhqnDbONZ5PahJd3rPZBNYL9vnw5tuo87gnngs7yrGhUhK2nPVByeMJPkx/wDh8/3+UpVripVrSk3UmlKawc40lqwhjqTw6NnOyJ3OcZxlTcm9L8nNbW44PFdD3gfZ7S/lsskiFkGcnbUNPjaCT82peonSArTnue3lKswT1a/5xM6YBms5yLmVPJl04/nKnSeGrvalWMJfNJmymqZ0vBdx17bt4EjTeDNnC2saOCWlKnCrUa21K1SKbbe/W0lzJG3ZFt9GCx4z1t8rZq9B+17CHjxoY9EaSfrwNytdSRdbqIURzMvQokymyBSkSYzKlkNS4QZPyvPKtrVtqzhYxdB1Eq8YU4wjL8vGpRwxqucX3r3YLXHabnOoYpVDBUqBO2eUzFOZh7oWuZKNsWUbWnWpVKNWKnTqRcJweyUX+3nPBzJOULa7tXJyVvcVIRb5FKUH6XTcumTPdq1MDwszjx/4m+W5rP8AzFYiU1dIABy7AAAAAAAAAABgu9ketEtlg04vWpJpp7Gt5W7fEXLJFj2r+dwQ4jw4zOVp16lexnFxqScnTm2tFt4vBrF+bB+bYp+b3NfUtqnd7vQnUSwgu+lGmuVaSWvmw8+GKfXpMpJAY44QilsjFYeZI8j8bLB1O5fhdB1G8FFVItt8iwOfZ6eF1Si42NGTpyqqDlU8WDbT8/e/PjtSOIXMXrlpSeO+csZPp/lgfYjlik08U9aaeKawJFF97HoXqOTZj+EVWvbVqFaTn3B97J4t6LSwTe/f6OdnWaCwjHoXqAuNUzpeC7jr23bwNsNSzpeC7jr23bwA1C0fgxf2Gl/h0kblQlqNMttuTOe3/wBFI22hLUX29M9e5ejCZlVUhRkV7oVu9pUqpilUMEpljmSbSNMtdQjuoRb28UI479y3tjRtZlS7/MjxpavMR8yywjlFclxVX+PWLLSk2+6T4z2cyMmZt+EV/eK79FxW+0XjUQnHO5dKABWtAAAAAAAAAABFvttPbxuTUtT2mOtLDDkerHke4y3r4nWRbKCawetPUwhjci3SMbpyjq1yW6X5yXPy9JY6q5fTGS9YHK89nBCtcOne28dOVOOhUguM4rZh0Yvpxe/BPkGT8i3lSqqMberpvve/pVMKeOrSerVhy7j6wlUT3r1keFlTx72jFvl0FFY+dfsA1nN7wVhZUVCOMpVMNOb/ADngtLDmWD88tr1N7+iPb2+Gt65bNWxLkRIQA1POl4Lr9e27eBthqedLwXcda27eAGpaOEMlS9xCHxqMH/pNmoPUa/Xp+0LSottKNpU82hGL+aTPct5YpNbHg0X26hnjuUxSGkY0yyczh0vlMxSqGCtcJa20lyvUjwL3L+Mu5W6dSo9WKTaT5uc7isz0rtkrXt7V7lGNPVtk9kSPZ0ZVH3Wpv4q3Nc3N6+gxZLyM1+UrvTqPXo7Uunl6NnSezgdxWIRWZtzPCzAiZnONlDb/AFi514av6zU/n0k9IhZnNuUfhFxq/wDIqleX0vxulAApWgAAAAAAAAAAi30eI8dkljq2hFb16odZeplEEKtluiioAporkRXArgVAtKYlzRaBTE1TOj4Lr9a37eBtbNTzoeDK/Wt+3gB52S6KnZ28JLGMqFGLXM6STI+TrnQxoVXhOnqxepSjukuZ/wC24n5EXtW195odlEuyhk2nWSU1rjxZxeE49D/YadbhnnvcMde/pRWLqQS6cfUaxlbhlRjjGknUl6Ev558CNwjyPQpYRda4r1J8ShFwjjzzklio8pBydkGMEpTSctuik9CPp29LLaYonlky5rRww90vLx71B8+hT+NtfmRt/B/JPclgqlKnjqbp0tKp0Oc2/milzHkuq1qWoz21809pfOLjhmrmiLc9t2oZPTXe1nJ/2ihh9FLD5yPHX5m01yNPBrzNNeY82xyrhhrPQtJaSlPx51ZLo02sfPhj5zNaunoUttekedmdi9LKLx1K4uE1hrbdzVw1+Z+k9XA8zM89eU1/ebj6xWKMjRjdIABUtAAAAAAAAAABFvtkOsvUwit8tUeaSw+ctQQqwgmXYAUxKoYFEAZaVZRgWmq50V/Rdd+6tu3gbUarnQf9F1+tb9vADBkOPtW195odlEi8I8rK3prDXVqYxpx36tr82K9JOyHH2ra+8W/ZRNRyjL8IyhU3wo/k4rctFtP6Wl6Ea8ddyx57zWOO5MnWMm3Vqd9UnrlJ7luS5EibUtz0aVHUXSpF/npl/Xw1+4tzza9TRZsd7FJNs0bLl532Edr2L1t8xfS/HLLkx/KNPbyTVnWqwpU+NLft0I75PoXz4LeblUyrbUsKamu9Siox77BLVhjs3HOcjVpxpuEe97p/zJ/nzjuT8WPud+/HYvfyfSUdeGsy5ftuxX1GoblaXdOrrpzjPDbg02uk87M/xspfCbj6zVIMXrU4d7OOxrfzPlJuZl6SyjNrW7is+jG4rN+pGXI2YrbdKABUvAAAAAAAAAABHvdketEpFFbzZHrRLVIIGisWV2mMDI0WsKQkwLcQUCYBmp5z/Blx1rft4G1yNTzneDLjrW/bwAzZBj7VtPebfsomkcH9dW4k9vdJY9O1/O2b3kGPtS094t+yiaNlS3qWN5WnKL/BribqU6qXeQlLjQk/zWnsx2rz4bMU+mH8iJ4n6bRTRfKJByfewnhhOGvYlKLk+iK1str5Y0nOna0+6yi3GdaacaNOW9cspc2rA5ne3O4eXwovI0oYze3HRguNN83Nz7jRrS1nVm6k1t3c25dHr2vm2i7yM5zdStOVWo8MZS5tmCWpLm3YkijZJbi2LahTaszKJZ2uB6MI4F8aWBdolVrbW1rpkpHo5luLlH4RV7esQKSJ+Zbi5R+EVe3rFWRpwdy6WACppAAAAAAAAAABHvdketEsjIvvuKutExIIZOj0FrKlGBaGABbiEV0SgBs1POd4MuOtb9vA2s1TOb4MuOtb9vAD0MgL2pae8W/ZRJtRLB6WCjg3Jyw0Ultxx3EfIC9qWnvFv2UTXuE127is7GD/ACNPRd21/wBSW2NHo2OXLilyo0QqvOljuHeNxot29jrTnTXc617y6LWunS5130t2C2y5UoQhGnTjGEIrCMIpKMVzJGajTwSS1JFtSBEypeXVp4mJ0z0KkDBOI2jSFKBY0SZRMbiShZBE7Mtxco/CKvb1iGkTMy3Fyj8Iq9vWOMi3B3LpYAKmkAAAAAAAAAAEe+4q60TCmZr3irrRMOAQq2EymGoqlqABCRbiBfvGGJY2VjICjW41POb4MuOtb9vA2ybNSzm+DLjrW/bwAmU79W+S6Vw1j3O1oOMfGm6UVCPnk0vOeNwcsHCmnN6VSbdSpJ7ZVJPGT9LK5eljk/JNHdV/A9LnjTt9P/2UT17SngkXelFubfxdoGKcSVJGKcTkQqkSNOJPqRI84HTmYQZRMUokucDG4EuEbAk5luLlH4RV7esWaBfmY4uUfhNXt6xxdbh7l0oAFbQAAAAAAAAAACPe8VdZGHEy33FXWiYEEFR6mXUn3q8/Jy8xgusdCSSberBLB461y6vSLRNQimmnyPRxWv3La+cCS9hZgXplsgLGXRZYy3EC6TNUzl+DLjrW/wBYpm1NmrZzPBlx1rf6xACJlGONLIfNST8/4NT/ANz3aC1Hm3NLG0yTPxI26+Nbf7I9WktSLfSmY+UjRjmjOzHJEIRpRMM4EuUTHKBKEKUCx0ya6ZTuQRpCVIwZm9mUvhNb6xWPVVI8vM9/3P4VX+sVjmyzFDo4AOFwAAAAAAAAAAI99xY9aJhw1GXKC7zHxWpPo3+swRlitQQFGVkyiAugyrlqLdIS1gWMoXMtT1gVNVzmeDbjrW/b0zaJbTweHNlKtk+5pwTc9GNRRWuUnTnGeC53o4ecDNa0lUyZauOvC3tKkGteOjShLV0rH0mW2njFHLs3edOjbW9Oyv1PRoLQo3NOPdE6S4sZxWvUtSaxxWGK1YvYI5yckRk1G5m4Y4x9rXOpcnE3FtbRpxas7bsyxmo+ydkjymf6tc/uFPZNyR5TP9Wuf3CJmHPjLbcCmial7JuSPKZ/q1z+4V9k3JHlM/1a5/cI2jxltegXKmams5uSPKZ/q11+4XLOdkfymf6tdfuDafGW2Kma/mfevKmHlVf6xXNc4R527SFKUbFVK9eSahUlTlTo0n4z0sJSa2pJYatbRsGYixnDJ8608fy89KDeLc4pa5c+MnPXv2nMy7pGnSQAQ7AAAAAAAAAAAaIUrJp95LBeK1ivM9xNAEF21T3H0grWpyw+kTgBA/BanLD6Rd+DVPcfSJoAgO1qcsPpBWlTlh9IngDz3Zz5YfSCsJPjSSXJFa352egAOd8JM0GT7qrKvTdS2qTblNU2nSnJ7W4vY+hrHeeJ7BdDyr/Cq/fHXwByD2C6PlS+SrffD2C6HlS+SrffHXwByD2C6PlS+SrffD2C6PlS+SrffHXwByD2C6PlS+SrffD2C6PlS+SrffHXwBy7JWZKwpzjOvVq3Cjr7lxKcn7rW5Yc2J023oRhGNOEVCEEoxjFYRjFbEkZAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB//2Q==";
  final String PName = "Iphone 15 ProMax";
  final String discount = "5% Off";
  final double Price = 150000;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ecomerse App",),backgroundColor: Colors.purple,),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(Imageurl),fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Text(discount,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),


                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,

                  child: InkWell(
                    onTap: (){
                      btnSnk("Clicked",context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite,color: Colors.red,),
                    ),
                  )
              ),

              Positioned(
                bottom: 40,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Text("\$$Price",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),


                ),

              ),

              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(PName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),


                ),

              ),



              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(onPressed: (){
                    btnSnk("Add to Cart Item",context);
                  }, child: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(),
                    ),


                  ),


                ),

              ),


            ],
          ),
        ),

      ),
    );
  }
}
