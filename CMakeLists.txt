cmake_minimum_required(VERSION 3.16)

project(DietWorkoutTracker VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ✅ Include all required Qt components
find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 QuickLayouts)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appDietWorkoutTracker
    main.cpp
)

qt_add_qml_module(appDietWorkoutTracker
    URI DietWorkoutTracker
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES PageElements/TopBar.qml
        QML_FILES
        QML_FILES Diet/DietPage.qml
        QML_FILES Workout/WorkoutPage.qml
        QML_FILES PageElements/DietDrawerContent.qml
        QML_FILES PageElements/WorkoutDrawerContent.qml
        QML_FILES MyDialogs/CreateFoodDialog.qml
        QML_FILES
)

set_target_properties(appDietWorkoutTracker PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# ✅ Link all required Qt components
target_link_libraries(appDietWorkoutTracker
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::QuickLayouts
)
set(QMLCACHEGEN TRUE)


include(GNUInstallDirs)
install(TARGETS appDietWorkoutTracker
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
qt_import_qml_plugins(appDietWorkoutTracker)
