//
//  MealService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 13/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class MealService : MealIteractor {
    let mealPresenter: MealPresenter
    let mealPersistence = MealPersistence()

    init(mealPresenter:MealPresenter) {
        self.mealPresenter = mealPresenter
    }
    
    func dateSelected(date: Date) {
        let mealsForDate = mealPersistence.getMeals(forDate: date)
        mealPresenter.updateMealList(meals: mealsForDate)
    }
    
    func onSavePressed(meal: Meal) {
        mealPersistence.saveOrUpdateMeal(meal)
        if (meal.primaryKey == nil){
            mealPresenter.showAlert(message: "Refeição adicionada com sucesso")
        }else{
            mealPresenter.showAlert(message: "Refeição atualizada com sucesso")
        }
    }
    
    func onCancelPressed() {
    
    }
    
    func onDeletePressed(meal: Meal) {
        mealPersistence.deleteMeal(meal: meal)
    }
}
