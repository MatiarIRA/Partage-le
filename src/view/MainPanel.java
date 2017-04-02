/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controller.*;


import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.JOptionPane;


/**
 *
 * @author hansdaigle
 */
public class MainPanel extends JFrame {

    
    private static JPanel pane = new JPanel();
    private Border border = BorderFactory.createLineBorder(Color.BLACK);
    private static String fileByLine[];
    
    private static JButton openFileButton = new JButton("Ouvrir un fichier");
    
    private static JButton createCSV = new JButton("Enregistrer sous .CSV");
    
    private static JComboBox classeCB = new JComboBox();
    private static JLabel classeJl = new JLabel("Choisir une classe :");
    
    private static JLabel attributsJl = new JLabel("Attributs");
    private static JTextArea attributsList = new JTextArea(5, 20);
    private static JScrollPane attributsScroll = new JScrollPane(attributsList);
    
    private static JLabel methodesJl = new JLabel("Méthodes (Attributs de la méthode)");    
    private static JTextArea methodesList = new JTextArea(5, 20);
    private static JScrollPane methodesScroll = new JScrollPane(methodesList);
    
    private static JLabel sClassesJl = new JLabel("Sous-Classes");    
    private static JTextArea sClassesList = new JTextArea(5, 20);
    private static JScrollPane sClassesScroll = new JScrollPane(sClassesList);
    
    private static DefaultListModel linkslistModel = new DefaultListModel();
    private static JLabel linksJl = new JLabel("Aggrégations/Relations");
    private static JList linksList = new JList(linkslistModel);
    private static JScrollPane linksScroller = new JScrollPane(linksList);   
    
//    Métrique JLIST
    private static DefaultListModel metriqueListModel = new DefaultListModel();
    private static JLabel metriqueJl = new JLabel("Métriques *"); 
    private static JList metriqueList = new JList(metriqueListModel);
    private static JScrollPane metriqueScroll = new JScrollPane(metriqueList);
    private static JLabel definitionJl = new JLabel("* Selectionnez une métrique pour connaitre sa définition", SwingConstants.CENTER);

    public MainPanel()        // the frame constructor
  {
        super("Partage le");
        setBounds(450,200,705, 380);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Container container = this.getContentPane(); // inherit main frame
        
// Bouton Open files
        openFileButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {

                classeCB.setSelectedIndex(0);
            }
        });
        openFileButton.setBounds(10, 10, 120, 40);
        
        
// Bouton CSV

        createCSV.setBounds(500, 10, 200, 40);        
        
// ComboBox Classe + Label
        classeCB.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

            }
        });
        classeCB.setBounds(280, 10, 150, 40);
        classeJl.setBounds(150, 25, 150, 10);
        
// AttributsList
        attributsList.setEditable(false);
        attributsList.setBounds(10, 100, 150, 100);
        attributsList.setBorder(BorderFactory.createCompoundBorder(border, 
            BorderFactory.createEmptyBorder(10, 10, 10, 10)));
        attributsJl.setBounds(10, 85, 150, 15);
        
// MethodesList
        methodesList.setEditable(false);
        methodesList.setBounds(200, 100, 350, 100);
        methodesList.setBorder(BorderFactory.createCompoundBorder(border, 
            BorderFactory.createEmptyBorder(10, 10, 10, 10)));
        methodesJl.setBounds(200, 85, 300, 15);

// SousClasse
        sClassesList.setEditable(false);
        sClassesList.setBounds(10, 230, 150, 100);
        sClassesList.setBorder(BorderFactory.createCompoundBorder(border, 
            BorderFactory.createEmptyBorder(10, 10, 10, 10)));
        sClassesJl.setBounds(10, 215, 150, 15);
        
// Aggrégation, Relation etc.
        linksList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        linksList.setLayoutOrientation(JList.VERTICAL);
        linksList.setVisibleRowCount(-1);
        linksList.setBorder(BorderFactory.createCompoundBorder(border, 
            BorderFactory.createEmptyBorder(10, 10, 10, 10)));
        linksList.setBounds(200, 230, 350, 100);
        linksJl.setBounds(200, 215, 150, 15);

        linksList.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent evt) {
                //Ajouter une commande si nécéssaire
            }
        });

// Métrique Jlist
        metriqueList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        metriqueList.setLayoutOrientation(JList.VERTICAL);
        metriqueList.setVisibleRowCount(-1);
        metriqueList.setBorder(BorderFactory.createCompoundBorder(border, 
            BorderFactory.createEmptyBorder(10, 10, 10, 10)));
        metriqueList.setBounds(595, 100, 100, 230);
        metriqueJl.setBounds(600, 85, 300, 15);
        definitionJl.setBounds(265, 335, 500, 15);

        metriqueList.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent evt) {

            }
        });
        
        
// Add all containt to the container
        
        container.setLayout(null);
        container.add(pane);
        
        container.add(openFileButton);
        container.add(createCSV);
        
        
        container.add(classeCB);
        container.add(classeJl);
        
        container.add(sClassesList);   
        container.add(sClassesJl);
        
        container.add(attributsJl);
        container.add(attributsList);
        
        container.add(methodesList);
        container.add(methodesJl);
        
        container.add(linksList);
        container.add(linksJl);
        
        container.add(metriqueList);
        container.add(metriqueJl);
        container.add(definitionJl);
        

        setVisible(true); // make frame visible
    }
}
