(defproject api-starter-kit "0.1.0-SNAPSHOT"
  :description "API Starter Kit"
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [http-kit "2.2.0"]
                 [compojure "1.5.1"]
                 [javax.servlet/servlet-api "2.5"]
                 [ring/ring-devel "1.5.0"]
                 [ring/ring-core "1.5.0"]]
  :main ^:skip-aot api-starter-kit.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
