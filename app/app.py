from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
        <head>
            <title>DevOps Pipeline</title>
        </head>
        <body>
            <h1>Hello DevOps Pipeline 🚀</h1>
            <h2>Welcome to pvaranasi/flaskapp</h2>

            <p>Application: Python Flask</p>
            <p>Environment: production</p>
            <p>Status: Running ✅</p>
            <p>Version: 5.0</p>

            <hr>

            <h3>DevOps Pipeline</h3>
            <ul>
                <li>GitHub ✅</li>
                <li>Jenkins ✅</li>
                <li>Docker ✅</li>
                <li>Kubernetes 🚀</li>
                <li>Argo CD 🔄</li>
            </ul>
        </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
