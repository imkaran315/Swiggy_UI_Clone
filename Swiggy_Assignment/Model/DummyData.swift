//
//  Dummy.swift
//  Swiggy_Assignment
//
//  Created by Karan Verma on 08/12/24.
//

import Foundation
import UIKit

class DummyData {
    static let shared = DummyData()
    private init(){}
    
    // Dishes
    let dishes = [
        Dish(image: "Pizzas", name: "Pizzas"),
        Dish(image: "Cakes", name: "Cakes"),
        Dish(image: "Burgers", name: "Burgers"),
        Dish(image: "Noodles", name: "Noodles")
    ]
    
    // Slides images
    let images = [
        UIImage(named: "slide1"),
        UIImage(named: "slide2"),
        UIImage(named: "slide3"),
        UIImage(named: "slide4"),
        UIImage(named: "slide5")
    ]
    
    // Restaurants 
    let restaurants = [
        Restaurant(name: "Burger King",
                   image: "Burger King",
                   address: "Mehta Nagar",
                   category: "Burgers, American",
                   rating: "4.3(7.6K)",
                   description: "Known for its delicious flame-grilled burgers and crispy sides. A great spot for fast food lovers. Enjoy a variety of meals ranging from classic Whoppers to chicken sandwiches, all made fresh to order. Perfect for quick meals or satisfying late-night cravings."),
        
        Restaurant(name: "KFC",
                   image: "KFC",
                   address: "Downtown Avenue",
                   category: "Fried Chicken, Fast Food",
                   rating: "4.2(15.7K)",
                   description: "Famous for its crispy fried chicken and a wide range of flavorful sauces. KFC also serves wraps, rice bowls, and sides like coleslaw and mashed potatoes. A family-friendly spot where you can indulge in finger-lickin' goodness."),
        
        Restaurant(name: "Starbucks",
                   image: "Starbucks",
                   address: "Central Mall",
                   category: "Coffee, Beverages",
                   rating: "4.5(9.8K)",
                   description: "The go-to destination for premium coffee, refreshing beverages, and tasty snacks. From rich espresso drinks to seasonal favorites, Starbucks caters to every coffee lover's taste. Relax with their cozy ambiance and explore the extensive menu of pastries and sandwiches."),
        
        Restaurant(name: "Subway",
                   image: "Subway",
                   address: "City Square",
                   category: "Sandwiches, Healthy",
                   rating: "4.0(5.4K)",
                   description: "Offers fresh and customizable subs with a variety of healthy toppings. From hearty footlongs to wraps and salads, Subway provides nutritious and delicious options. Choose from an array of breads, meats, and sauces to craft your perfect meal."),
        
        Restaurant(name: "Domino's Pizza",
                   image: "Dominos",
                   address: "Green Street",
                   category: "Pizza, Fast Food",
                   rating: "4.3(10.9K)",
                   description: "Known for its quick delivery and a wide variety of pizzas. Domino's offers innovative flavors, cheesy crusts, and sides like garlic breadsticks and chicken wings. Ideal for family gatherings, casual dinners, or late-night munchies.")
    ]
}
