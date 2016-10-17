(ns api-starter-kit.core
  (:use [org.httpkit.server :only [run-server]]
        [compojure.route :only [not-found]]
        [api-starter-kit.controllers.status_controller :as status]
        [api-starter-kit.controllers.auth_controller :as auth])
  (:require [ring.middleware.reload :as reload]
            [compojure.handler :as handler]
            [compojure.core :refer :all]))

(defroutes simple-routes
  (GET "/api/v1/ping", [] status/ping)
  (POST "/api/v1/auth/signup", [username name password passwordVerify] (auth/signup username name password passwordVerify))
  (not-found "404 - Route not found"))

(defn -main [& args]
  (println "Listening on port 8888")
  (run-server
    (reload/wrap-reload
      (handler/site #'simple-routes)) {:port 8888}))
