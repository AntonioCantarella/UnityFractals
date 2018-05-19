using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class FractalController : MonoBehaviour
{

    public Material _fractalMaterial;

    public Vector2 _pos;

    public float _scale;
    public float _loopCount;
	
    
    // Update is called once per frame
	void Update ()
	{
		_fractalMaterial.SetVector("_Area", new Vector4(_pos.x, _pos.y, _scale, _scale));
	    _fractalMaterial.SetFloat("_LoopCount", _loopCount);
    }
}
