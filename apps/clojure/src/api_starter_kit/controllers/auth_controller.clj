(ns api-starter-kit.controllers.auth_controller)

(defn signup [username name password passwordVerify]
  (println username "is trying to sign up")
  (str username " " password " " passwordVerify))
