import time
from flask import Flask
from flask_cors import CORS, cross_origin

# 1. Inisialisasi app HANYA SATU KALI
app = Flask(__name__)

# 2. Terapkan CORS dan konfigurasi lain ke app ini
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# 3. Daftarkan route Anda ke app yang sama
@app.route('/time')
@cross_origin()
def get_current_time():
    return {'time': time.time()}

# 4. Jalankan app
if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host="0.0.0.0", debug=True, port=5000)