(ns api-starter-kit.core
  (:require [org.httpkit.server :refer [run-server]]
            [compojure.core :refer [defroutes GET POST]]
            [compojure.route :refer [not-found]]
            [ring.middleware.reload :as reload]
            [api-starter-kit.controllers.status_controller :as status]
            [api-starter-kit.controllers.auth_controller :as auth])
  (:gen-class))

(defroutes simple-routes
  (GET "/api/v1/ping", [] status/ping)
  (GET "/api/v1/users", [] status/list-users)
  (POST "/api/v1/auth/signup",
        [username name password passwordVerify]
        (auth/signup username name password passwordVerify))
  (not-found "404 - Route not found"))

(defn example-logger [handler]
  (fn [req]
    (println "EXAMPLE LOGGER")
    (handler req)))

(defn app []
  (-> simple-routes
      reload/wrap-reload
      example-logger))

(defn -main [& args]
  (run-server (app) {:port 8888})
  (println "Listening on port 8888"))
