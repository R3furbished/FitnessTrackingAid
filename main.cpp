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
    user.setMaint_cal(2300);
    user.setDaily_cal(2300);
    user.setProt_target(180);
    user.setCarb_target(100);
    user.setFat_target(50);
    user.setActive_lvl(3);

    // FoodItem *banana = new FoodItem(&engine, "Banana",120, 5,40,50);
    // FoodItem *orange = new FoodItem(&engine, "Orange",200);
    // FoodItem *kiwi = new FoodItem(&engine, "Kiwi",60);
    foodManager.addFoodItem("Banana",89,100,1,0,22);
    foodManager.addFoodItem("Chicken",110,100,23,1,0);
    foodManager.addFoodItem("Egg",147,100,12,10,1);
    foodManager.addFoodItem("Apple",52,100,0,0,14);
    foodManager.addFoodItem("Whey",113,30,24,3,10);

    dayManager.newDay(getFormattedDate());

    engine.rootContext()->setContextProperty("foodManagerModel" , &foodManager);
    engine.rootContext()->setContextProperty("dayManagerModel" , &dayManager);
    engine.rootContext()->setContextProperty("user" , &user);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DietWorkoutTracker", "Main");

    return app.exec();
}
