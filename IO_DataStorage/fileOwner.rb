data = File.stat("sample.txt")
owner_id = data.uid
group_id = data.gid
puts "owner:#{owner_id}"
puts "group:#{group_id}"

# uid = 201
# gid = 10
# File.chown(uid, gid, "alpah", "beta")
# f1 = File.new("delta")
# f1.chown(uid, gid)
# f2 = File.new("gamma")
# f2.chown(nil, gid)    # --> keep original owner id by nil
#
# == File.chmod(mode, file_name, ...) ===
# File.chmod(0644, "epsilon", "theta")
# f = File.new("eta")
# f.chmod(0444)
#
# Get the stat of file
info = File.stat("sample.txt")
rflag = info.readable?
wflag = info.writable?
xflag = info.executable?
puts "info.readable? = #{rflag}, .writable? : #{wflag}, .executable? = #{xflag}"
 
rf2 = info.readable_real?
wf2 = info.writable_real?
xf2 = info.executable_real?
puts ".readable_real? = #{rf2}, .writable_real? : #{wf2}, .executable_real? = #{xf2}"
