//part of dartlero_contacts_personne;
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:convert';
import 'package:validator/validator.dart';

@CustomTag('contact-add')
class ContactAdd  extends PolymerElement{

  @published Personne personne;
   @published Contact contact;
   
 // ContactTable contactTable;

  Element message;
  //DivElement divFormAddContact;
  InputElement email, telephone;
  SpanElement spanTitleFormeAddContact;
  //ButtonElement buttonAddContact, buttonShowaddContactForm;
  
  
  ContactAdd.created() : super.created();

//  void intialisation() {
//    
//    spanTitleFormeAddContact = querySelector("#contactOfAdd");
//    divFormAddContact = querySelector("#showContactAddForm");
//    
//    message = querySelector("#add-contact-message");
//    email = querySelector("#add-contact-email");
//    telephone = querySelector("#add-contact-telephone");
//
//    buttonShowaddContactForm = querySelector("#ShowAddContactFormButton");
//    buttonShowaddContactForm.onClick.listen(ShowAddFormContact);
//
//    buttonAddContact = querySelector("#addContactButton");
//    buttonAddContact.onClick.listen(addContact);
//
//  }


//  ShowAddFormContact(MouseEvent event) {
//
//    spanTitleFormeAddContact.text =
//        "contact de: ${contactTable.personne.prenom} ${contactTable.personne.nom}";
//
//    if (buttonShowaddContactForm.text == 'Show Add') {
//      divFormAddContact.style.display = "block";
//      buttonShowaddContactForm.text = 'Hide Add';
//      buttonShowaddContactForm.name = contactTable.personne.idPersonne;
//      contactTable.contactedit.divFormEditContact.style.display = "none";
//      
//    } else {
//      divFormAddContact.style.display = "none";
//      buttonShowaddContactForm.text = 'Show Add';
//      buttonShowaddContactForm.name = "";
//
//      message.text = "";
//      email.value = "";
//      telephone.value = "";
//    }
//
//  }

  addContact(Event e, var detail, Node target) {

    var error = false;
    email = email = shadowRoot.querySelector("#add-contact-email"); 
    telephone = shadowRoot.querySelector("#add-contact-telephone");
    message = shadowRoot.querySelector("#add-contact-message");
    message.text = '';
    
    if (!isEmail(email.value)) {
      message.text = 'Veuillez saisir un email.';
      error = true;
    }
    
    if (!matches(telephone.value, telephone.pattern)) {
      if (error) {
        message.text =
            'Veuillez saisir un email et un télephone dans ce format: 111-555-4444 svp.';
      } else {
        message.text =
            'Veuillez saisir un téléphone dans ce format: 111-555-4444 svp.';
        error = true;
      }
    }

    if (!error) {
      contact = new Contact();
      contact.email = email.value;
      contact.telephone = telephone.value;
      contact.idContact = '${email.value} + ${telephone.value}';
      if (personne.contacts.add(contact)) {
        message.text = 'Le contact a été ajouté';
        personne.contacts.order();
        //contactTable.showContactList();
        email.value = "";
        telephone.value = "";
      } else {
        message.text = 'Le contact existe déjà';
      }
    }
  }
}
