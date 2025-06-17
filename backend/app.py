import os
import openai
from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

openai.api_key = os.environ.get("OPENAI_API_KEY")

@app.route("/generate_workout", methods=["POST"])
def generate_workout():
    data = request.json
    goal = data.get("goal")
    level = data.get("level")
    days = data.get("days")

    prompt = f"""
    You are an expert personal trainer. Generate a weekly workout plan for a user.
    Goal: {goal}
    Level: {level}
    Days per week: {days}
    Give detailed exercises for each day, including sets, reps, rest times.
    """

    response = openai.ChatCompletion.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": "You are a personal trainer AI."},
            {"role": "user", "content": prompt}
        ],
        max_tokens=1000
    )

    plan = response.choices[0].message.content
    return jsonify({"plan": plan})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
