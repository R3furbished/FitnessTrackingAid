#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDate>
#include <QLocale>
#include "fooditem.h"
#include "foodsmanager.h"
#include "daymanager.h"
#include "dailymeals.h"
#include "userfitnessinfo.h"


QString getFormattedDate() {
    QLocale locale = QLocale::system(); // Get system locale
    QString dateFormat = locale.dateFormat(QLocale::ShortFormat);
    return QDate::currentDate().toString(dateFormat);
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    FoodsManager foodManager;
    DayManager dayManager;
    UserFitnessInfo user;

    user.setWeight(61);
    user.setHeight(173);
    user.setMaint_cal(2500);
    user.setDaily_cal(2500);
    user.setProt_target(200);
    user.setCarb_target(200);
    user.setFat_target(100);
    user.setActive_lvl(3);

    // FoodItem *banana = new FoodItem(&engine, "Banana",120, 5,40,50);
    // FoodItem *orange = new FoodItem(&engine, "Orange",200);
    // FoodItem *kiwi = new FoodItem(&engine, "Kiwi",60);
    foodManager.addFoodItem("banana",89,100,1,0,22);
    foodManager.addFoodItem("chicken",110,100,23,1,0);
    foodManager.addFoodItem("egg",147,100,12,10,1);
    foodManager.addFoodItem("apple",52,100,0,0,14);
    foodManager.addFoodItem("whey",113,30,24,3,10);

    dayManager.newDay(getFormattedDate());

    engine.rootContext()->setContextProperty("foodManagerModel" , &foodManager);
    engine.rootContext()->setContextProperty("dayManagerModel" , &dayManager);
    engine.rootContext()->setContextProperty("user" , &user);

    // dayManager.getLatestDay()->createMeal("19:20:21");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:20:31");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:20:51");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:25:01");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:25:12");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:25:22");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());
    // dayManager.getLatestDay()->createMeal("19:25:44");
    // dayManager.getLatestDay()->addMeal(dayManager.getLatestDay()->getLatestMeal());

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DietWorkoutTracker", "Main");

    return app.exec();
}
