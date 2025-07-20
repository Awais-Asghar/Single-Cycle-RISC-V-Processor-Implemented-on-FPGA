# Use this file to generate the data_mem.mem File instead of writing that file manually
with open("data_mem.mem", "w") as f:
    for i in range(255):    # 1MB = 256 words
        f.write(f"{i:08x}\n")  # write 32-bit hex values
