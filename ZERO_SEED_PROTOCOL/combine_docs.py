import os

files = [
    r"CHATGPT_SESSION_2_RECORD.md",
    r"CHATGPT_SESSION_3_RECORD.md",
    r"PHASE2_OSF_PREREGISTRATION.md",
    r"PROTOCOL_AND_RESULTS.md",
    r"README.md",
    r"THE_PROOF.md",
    r"CHATGPT_FOLLOWUP.md",
    r"CHATGPT_SESSION_1_RECORD.md"
]

with open("MASTER_ZERO_SEED_PROTOCOL_COMBINED.md", "w", encoding="utf-8") as out_f:
    for f in files:
        if os.path.exists(f):
            with open(f, "r", encoding="utf-8") as in_f:
                out_f.write(f"\n\n# === {f} ===\n\n")
                out_f.write(in_f.read())
        else:
            print(f"Watch out, expected to find {f} but it wasn't there!")

print("Combination complete. Originals are untouched.")
