#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "fooditem.h"
#include "foodsmanager.h"
#include "daymanager.h"
#include "dailymeals.h"
#include "userfitnessinfo.h"

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
    foodManager.addFoodItem("Banana",120,100,5,40,50);
    foodManager.addFoodItem("Orange",220,100,10,60,70);
    foodManager.addFoodItem("Kiwi",330,100,20,43,50);
    foodManager.addFoodItem("Rab",330,100,20,43,50);
    foodManager.addFoodItem("Tool",330,100,20,43,50);
    foodManager.addFoodItem("Oplank",220,100,10,60,70);
    foodManager.addFoodItem("Frag",330,100,20,43,50);
    foodManager.addFoodItem("Hei",330,100,20,43,50);

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
