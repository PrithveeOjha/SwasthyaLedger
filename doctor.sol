pragma solidity >=0.4.22 <0.7.0;

 
contract Doctor {
   
     
      mapping(uint256 => doctor) doctorlist;
    
     struct doctor{
         string doctor_name;
         string doctor_specialisation;
         uint256 doctor_ph_no;
         string doctor_address;
     }
     doctor d;
     
     address owner;
     
   
      constructor()  public {
          owner = 0xC193286a46C93D529cB6F5298db4F61183A6154b; //Address of Hospital
      }
      
     // modifier to give access only to hospital
       modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }
     
   function store_doctor_details(uint16 doctor_id,string memory _doctor_name,string memory _doctor_specialisation,uint256 _doctor_ph_no,string memory _doctor_address)public isOwner {
    
         d.doctor_name = _doctor_name;
         d.doctor_specialisation = _doctor_specialisation;
         d.doctor_ph_no = _doctor_ph_no;
         d.doctor_address = _doctor_address;
         
         
        doctorlist[doctor_id] = d;
        
        
   }
         
    
         function retreive_doctor_details(uint16 doctor_id) public view returns (string memory,string memory,uint256,string memory){
             
     doctor memory d = doctorlist[doctor_id];
     
     return (d.doctor_name,d.doctor_specialisation,d.doctor_ph_no,d.doctor_address);
     
          }
           
              
}